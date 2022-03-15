local luaQuery = function (obj)
    local o = {}
    function o:anime(p)
        if p.top then                        
            local sm = p.top/(p.time*20)
            local t = p.time*20
            World.Timer(1,function ()
                local pos = obj:getYPosition()[2]                
                obj:setYPosition(UDim.new(0,pos - sm))
                t = t - 1
                if t <=0 then
                    if  p.callBack then
                         p.callBack(obj)
                    end                   
                    return false
                end
                return true
            end)
        end
        if p.bottom then                        
            local sm = p.bottom/(p.time*20)
            local t = p.time*20
            World.Timer(1,function ()
                local pos = obj:getYPosition()[2]                
                obj:setYPosition(UDim.new(0,pos + sm))
                t = t - 1
                if t <=0 then
                    if  p.callBack then
                         p.callBack(obj)
                    end                   
                    return false
                end
                return true
            end)
        end
        if p.left then                        
            local sm = p.left/(p.time*20)
            local t = p.time*20
            World.Timer(1,function ()
                local pos = obj:getXPosition()[2]                
                obj:setXPosition(UDim.new(0,pos - sm))
                t = t - 1
                if t <=0 then
                    if  p.callBack then
                         p.callBack(obj)
                    end                   
                    return false
                end
                return true
            end)
        end
        if p.right then                        
            local sm = p.right/(p.time*20)
            local t = p.time*20
            World.Timer(1,function ()
                local pos = obj:getXPosition()[2]                
                obj:setXPosition(UDim.new(0,pos + sm))
                t = t - 1
                if t <=0 then
                    if  p.callBack then
                         p.callBack(obj)
                    end                   
                    return false
                end
                return true
            end)
        end
    end
    -- function o:rotation(p)           
    --     if p.x then
    --         local sm = p.x / (p.time*20)
    --         World.Timer(1,function ()
    --             print("erwerwerwer")
    --             local r = obj:getProperty("Rotation"):gsub("%:","="):gsub("% ",",")
    --             print(r)
    --             local rotation = Lib.stringToTable("{"..r.."}")   
    --             -- rotation.x = rotation.x + sm       
    --             -- if rotation.x >= 360 then
    --             --     rotation.x = rotation.x - 360
    --             -- end  
    --             rotation.x = 1
    --             obj:setProperty("Rotation", "w:"..rotation.w.." x:"..rotation.x.." y:"..rotation.y.." z:"..rotation.z)
    --             return true
    --         end)           
    --     end
        
    -- end
    function o:width(p)
        local sm = p.width / (p.time*20)
        local time = p.time*20
        World.Timer(1, function ()
            local width = obj:getWidth()[2]
            obj:setWidth(UDim.new(0,width + sm)) 
            time = time - 1
            if time <=0 then
                return false
            end
            return true
        end)
    end
    function o:height(p)
        local sm = p.width / (p.time*20)
        local time = p.time*20
        World.Timer(1, function ()
            local width = obj:getHeight()[2]
            obj:setHeight(UDim.new(0,width + sm)) 
            time = time - 1
            if time <=0 then
                return false
            end
            return true
        end)
    end
    function o:fadeIn(p,callBack)
        if type(p) == "string" and p == "slow" then
            p = 3
        end
        if type(p) == "string" and p == "fast" then
            p = 0.5
        end
        local time = p*20
        local sm = 1/time
        obj:setVisible(true)
        obj:setAlpha(0)
        World.Timer(1,function ()
            local alpha = obj:getAlpha()
            obj:setAlpha(alpha + sm)
            time = time - 1
            if time <= 0 then
                if callBack then
                    callBack()
                end
                return false
            end
            return true
        end)
    end
    function o:fadeOut(p,callBack)
        if type(p) == "string" and p == "slow" then
            p = 3
        end
        if type(p) == "string" and p == "fast" then
            p = 0.5
        end
        local time = p*20
        local sm = 1/time
        obj:setAlpha(1)
        World.Timer(1,function ()
            local alpha = obj:getAlpha()
            obj:setAlpha(alpha - sm)
            time = time - 1
            if time <= 0 then
                if callBack then
                    callBack()
                end
                obj:setVisible(false)
                return false
            end
            return true
        end)
    end
    function o:fadeToggle(p,callBack)
        if type(p) == "string" and p == "slow" then
            p = 3
        end
        if type(p) == "string" and p == "fast" then
            p = 0.5
        end
        if obj:getProperty("Visible") == "true" then
            o:fadeOut(p,callBack)
        else
            o:fadeIn(p,callBack)
        end
    end
    return o
end

return luaQuery