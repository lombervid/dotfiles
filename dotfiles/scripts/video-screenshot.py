#!/usr/bin/env python
import subprocess
import argparse
import os
from pathlib import Path

def get_video_duration(video_path):
    """
    Get the duration of the video in seconds using ffprobe.
    """
    try:
        result = subprocess.run(
            ["ffprobe", "-v", "error", "-show_entries", "format=duration",
             "-of", "default=noprint_wrappers=1:nokey=1", video_path],
            capture_output=True,
            text=True,
            check=True
        )

        duration = int(float(result.stdout.strip()))
        return duration
    except (subprocess.CalledProcessError, FileNotFoundError):
        print(f"Error: ffprobe is not installed or not in PATH.")
        return None
    except ValueError as e:
        print(f"Error: Could not parse video duration => {e}")
        return None

def extract_screenshots(video_path, num_screenshots):
    """
    Extract exactly X number of evenly spaced screenshots from a video using ffmpeg.

    Args:
        video_path (str): Path to the video file
        num_screenshots (int): Number of screenshots to extract
    """

    # Check if file exists
    if not os.path.exists(video_path):
        print(f"Error: Video file '{video_path}' not found.")
        return

    # Get video duration
    duration = get_video_duration(video_path)
    if not duration:
        return

    print(f"Video duration: {duration:.2f} seconds")

    # Create output directory
    output_dir = "screenshots"
    Path(output_dir).mkdir(exist_ok=True)

    # Get video filename without extension
    video_name = os.path.splitext(os.path.basename(video_path))[0]

    # Calculate timestamps for evenly spaced screenshots
    increment = int(duration / (num_screenshots + 1))
    timestamp = increment

    try:
        print(f"Extracting {num_screenshots} screenshots from '{video_path}'...")

        for i in range(1, num_screenshots+1):
            output_path = os.path.join(output_dir, f"{video_name}_screenshot_{i:03d}.png")

            # Build ffmpeg command to extract single frame at timestamp
            # ffmpeg -loglevel warning -hide_banner -ss ${ADD} -i "${FILENAME}" -frames:v 1 "${OUTPUT_DIR}/${FILENAME}/${ADD}-${FILENAME}.png"
            ffmpeg_cmd = [
                "ffmpeg",
                "-loglevel", "error",
                "-hide_banner",
                "-ss", f"{timestamp:.3f}",
                "-i", video_path,
                "-frames:v", "1",
                output_path
            ]

            subprocess.run(ffmpeg_cmd, check=True)
            print(f"  ✓ Screenshot {i}/{num_screenshots}")
            timestamp += increment

        print(f"\nSuccess! Extracted {num_screenshots} screenshots to '{output_dir}' directory.")

    except subprocess.CalledProcessError as e:
        print(f"Error: ffmpeg command failed: {e}")

def main():
    parser = argparse.ArgumentParser(
        prog='PROG',
        description="Extract screenshots from a video file using ffmpeg and ffprobe",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    parser.add_argument(
        "video_path",
        type=str,
        help="Path to the video file"
    )
    parser.add_argument(
        "-n", "--count",
        type=int,
        default=6,
        help="Number of screenshots to extract"
    )

    args = parser.parse_args()
    print(args)

    # Validate number of screenshots
    if args.count <= 0:
        print("Error: Number of screenshots must be greater than 0.")
        return

    extract_screenshots(args.video_path, args.count)

if __name__ == "__main__":
    main()
