function node_function()
end

function way_function()
    if not Holds("highway") then
        return
    end

    Layer("bikeability", false)

    if Holds("oneway") then
        Attribute("oneway", Find("oneway"))
    end

    if Holds("class:bicycle") then
        Attribute("class:bicycle", tonumber(Find("class:bicycle")))
        return
    end

    if Holds("class:bicycle:mtb") then
        Attribute("class:bicycle", tonumber(Find("class:bicycle:mtb")))
        return
    end

    if Holds("class:bicycle:technical") then
        Attribute("class:bicycle", tonumber(Find("class:bicycle:technical")))
        return
    end

    if Holds("class:bicycle:commute") then
        Attribute("class:bicycle", tonumber(Find("class:bicycle:commute")))
        return
    end

    if Holds("class:bicycle:touring") then
        Attribute("class:bicycle", tonumber(Find("class:bicycle:touring")))
        return
    end

    if Holds("class:bicycle:roadcycling") then
        Attribute("class:bicycle", tonumber(Find("class:bicycle:roadcycling")))
        return
    end

    if Holds("class:bicycle:trailer") then
        Attribute("class:bicycle", tonumber(Find("class:bicycle:trailer")))
        return
    end

    if Holds("class:bicycle:non_experienced") then
        Attribute("class:bicycle", tonumber(Find("class:bicycle:non_experienced")))
        return
    end

    local highway = Find("highway")

    if highway == "cycleway" then
        Attribute("class:bicycle", 2)
        return
    end

    local cycleway = Find("cycleway")
    local cyclewayLeft = Find("cycleway:left")
    local cyclewayRight = Find("cycleway:right")
    local cyclewayBoth = Find("cycleway:both")

    if
        cycleway == "track"
        or cyclewayLeft == "track"
        or cyclewayRight == "track"
        or cyclewayBoth == "track"
    then
        Attribute("class:bicycle", 2)
        return
    end

    local shoulder = Find("shoulder")

    if
        cycleway == "lane"
        or cyclewayLeft == "lane"
        or cyclewayRight == "lane"
        or cyclewayBoth == "lane"
        or shoulder == "yes"
        or shoulder == "left"
        or shoulder == "right"
        or shoulder == "both"
    then
        if
            highway == "unclassified"
            or highway == "residential"
        then
            Attribute("class:bicycle", 2)
        elseif
            highway == "secondary"
            or highway == "secondary_link"
            or highway == "tertiary"
            or highway == "tertiary_link"
        then
            Attribute("class:bicycle", 1)
        elseif
            highway == "primary"
            or highway == "primary_link"
        then
            Attribute("class:bicycle", -1)
        else
            Attribute("class:bicycle", -2)
        end
        return
    end

    if
        highway == "footway"
        or highway == "pedestrian"
    then
        if Find("bicycle") == "designated" then
            Attribute("class:bicycle", 2)
        elseif Find("bicycle") == "yes" then
            Attribute("class:bicycle", 1)
        else
            Attribute("class:bicycle", -1)
        end
        return
    end

    if highway == "path" then
        if
            Find("bicycle") == "yes"
            or Find("bicycle") == "designated"
        then
            Attribute("class:bicycle", 2)
        else
            Attribute("class:bicycle", -1)
        end
        return
    end

    if highway == "steps" then
        Attribute("class:bicycle", -1)
        return
    end

    if
        highway == "service"
        or highway == "track"
    then
        Attribute("class:bicycle", 1)
        return
    end

    if
        highway == "unclassified"
    then
        Attribute("class:bicycle", 1)
        return
    end

    local verge = Find("verge")
    local lanes = Find("lanes")
    if
        highway == "residential"
    then
        if
            (verge ~= "" and verge ~= "no")
            or lanes == "1"
        then
            Attribute("class:bicycle", 1)
        else
            Attribute("class:bicycle", -1)
        end
        return
    end

    if
        highway == "tertiary"
        or highway == "tertiary_link"
        or highway == "secondary"
        or highway == "secondary_link"
    then
        if verge ~= "" and verge ~= "no" then
            Attribute("class:bicycle", 1)
        else
            Attribute("class:bicycle", -1)
        end
        return
    end

    if
        highway == "primary"
        or highway == "primary_link"
    then
        if verge ~= "" and verge ~= "no" then
            Attribute("class:bicycle", -1)
        else
            Attribute("class:bicycle", -2)
        end
        return
    end

    -- otherwise assume highway is a motorway
    if highway ~= "" then
        Attribute("class:bicycle", -3)
        return
    end
end
