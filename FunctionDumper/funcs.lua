out = {"<?xml version=\"1.0\"?>\n<FunctionList>"} -- huge xml table
for k, v in pairs(wire_expression2_funcs) do
    if string.sub(v[1], 1, 3) ~= "op:" then -- don't include operators
        id, args = string.match(v[1], "(%w+)%(([^%)]*)%)") -- pull identifier and arguments out of signature
        table.insert(out, string.format("\n\t<Function Name=%q>\n\t\t<Arguments>%q</Arguments>\n\t\t<Return>%q</Return>\n\t\t<Description><![CDATA[DOCUMENT MEH]]></Description>\n\t</Function>",id, args, v[2])) -- add to the json table dohicky
    end
end
table.insert(out, "</FunctionList>")
file.Write("funcs.xml.txt", table.concat(out))
