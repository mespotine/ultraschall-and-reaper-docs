dofile(reaper.GetResourcePath().."/UserPlugins/ultraschall_api.lua")
local A2=ultraschall.ReadFullFile("c:\\Reaper-Internal-Docs\\Reaper-ConfigVariables-Documentation.txt")
local orgvars={}
local Acount=1

local ultraschall=ultraschall

while A2~=nil do
  line,offs=A2:match("(.-)\n()")
  if offs==nil then break end
  B=line:sub(1,1)
  if B~="" and B~=" " and B~="#" then orgvars[Acount]=line Acount=Acount+1 end
  A2=A2:sub(offs,-1)
end

local Clipboard_string = ultraschall.GetStringFromClipboard_SWS()

Clipboard_string=Clipboard_string.."\n "

ints={}
local integers=""
local doubles=""
count=1
ALABAMA=0

function main()
  for i=1,2500 do
    local var, offs=Clipboard_string:match("(.-)\r\n()")
    if var~=nil then var=var:lower() end
    ALABAMA=ALABAMA+1

    local A=reaper.SNM_GetIntConfigVar(var, -100)
    local B=reaper.SNM_GetIntConfigVar(var, -101)
    if A==B then
      for i=1, Acount do
--      if ints:match(var.."\n")==nil then        
--      end
        if orgvars[i]==var then found=true end
      end
      if found==false then ints[count]=var count=count+1 reaper.ShowConsoleMsg(var.."\n") end
      found=false
    end

    if offs==nil then 
      table.sort(ints)
      for i=1, count-1 do
        integers=integers..ints[i].."\n"
      end
      reaper.CF_SetClipboard("INTS:\n"..integers.."\n\nDOUBLES:\n"..doubles)
      return 
    end
    Clipboard_string=Clipboard_string:sub(offs,-1)
  end
  reaper.defer(main)
end

main()
