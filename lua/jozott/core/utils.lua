local Utils = {}

function Utils.merge(t1, t2)
    local result = {}

    -- Copy all key-value pairs from the first table to the result
    for k, v in pairs(t1) do
        if type(v) == 'table' then
            result[k] = Utils.cloneTable(v)
        else
            result[k] = v
        end
    end

    -- Merge the second table into the result
    for k, v in pairs(t2) do
        if type(v) == 'table' then
            if type(result[k] or false) == 'table' then
                result[k] = Utils.merge(result[k], v)
            else
                result[k] = Utils.cloneTable(v)
            end
        else
            result[k] = v
        end
    end

    return result
end

function Utils.cloneTable(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[Utils.cloneTable(orig_key)] = Utils.cloneTable(orig_value)
        end
        setmetatable(copy, Utils.cloneTable(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function Utils.dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

return Utils
