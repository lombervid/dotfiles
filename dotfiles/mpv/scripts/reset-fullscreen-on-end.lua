local function eof_handler(name, value)
    if value == true then
        mp.set_property('fullscreen', 'no')
    end
end

mp.observe_property('eof-reached', 'bool', eof_handler)
