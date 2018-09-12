dofile(reaper.GetResourcePath().."/UserPlugins/ultraschall_api.lua")
A2=ultraschall.ReadFullFile("c:\\Reaper-Internal-Docs\\Reaper-ConfigVariables-Documentation.txt")
orgvars={}
count=1
vars=""

while A2~=nil do
  line,offs=A2:match("(.-)\n()")
  if offs==nil then break end
  B=line:sub(1,1)
  if B~="" and B~=" " and B~="#" then orgvars[count]=line count=count+1 end
  A2=A2:sub(offs,-1)
end


for i=1, count-1 do
  vars=vars..orgvars[i].."\\n"
end

reaper.CF_SetClipboard(vars)
