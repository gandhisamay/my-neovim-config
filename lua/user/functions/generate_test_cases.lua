local f = require("user.functions.string_interpolation")
local file_exists = require("user.functions.file_exists")

local function generate_test_cases()
  local fileName = vim.fn.expand("%")
  -- local fileName = "advanced_keymaps.lua"
  local fileTypeLength = 3
  local fileNameWithoutFileType = string.sub(fileName, 0, string.len(fileName) - fileTypeLength)
  local generateTestCases = ":<CR>"

  for i = 1, 10, 1 do
    print(i)
    local inputFile      = "./" .. fileNameWithoutFileType .. f "in{i}"
    local outputFile     = "./" .. fileNameWithoutFileType .. f "out{i}"
    local compInputFile  = fileNameWithoutFileType .. f "_input{i}.txt"
    local compOutputFile = fileNameWithoutFileType .. f "_output{i}.txt"
    local exists         = file_exists(inputFile);

    print(inputFile, outputFile, compInputFile, compOutputFile)
    if exists then print("create new file") else break end
    -- run the cp command now
    generateTestCases = generateTestCases ..
        f ":!cp {inputFile} {compInputFile}<CR>" .. f ":!cp {outputFile} {compOutputFile}<CR>"
    print(generateTestCases)
  end

end

return generate_test_cases
