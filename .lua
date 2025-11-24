-- Simple Key Loader (Fixed Version untuk Delta Executor)
local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer

-- Ganti dengan RAW Pastebin KEYS KAMU (buat di pastebin.com: {"key1vip","key2premium","abc123"})
local keysUrl = "https://pastebin.com/raw/FwjQy1L7"  -- ← BUAT INI DULU & GANTI XXXXXX!

local keys
local success, err = pcall(function()
    local response = game:HttpGet(keysUrl)
    keys = HttpService:JSONDecode(response)
end)

if not success or type(keys) ~= "table" then
    -- Error GUI sederhana kalau keys gagal load
    local ScreenGui = Instance.new("ScreenGui")
    local ErrorLabel = Instance.new("TextLabel")
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    ErrorLabel.Parent = ScreenGui
    ErrorLabel.Size = UDim2.new(1, 0, 0, 100)
    ErrorLabel.Position = UDim2.new(0, 0, 0.5, -50)
    ErrorLabel.BackgroundColor3 = Color3.new(1, 0, 0)
    ErrorLabel.Text = "Error: Keys gagal load!\nBuat Pastebin baru dengan format JSON.\nError: " .. tostring(err)
    ErrorLabel.TextScaled = true
    ErrorLabel.Font = Enum.Font.SourceSansBold
    ErrorLabel.TextColor3 = Color3.new(1, 1, 1)
    return  -- Stop script
end

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local Button = Instance.new("TextButton")

ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.Name = "KeyLoader"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 350, 0, 200)
Frame.Position = UDim2.new(0.5, -175, 0.5, -100)
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)  -- Abu gelap
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.new(0, 1, 0)  -- Hijau

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.new(0, 0, 0)
Title.BorderSizePixel = 0
Title.Text = "Masukkan Key VIP"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold

TextBox.Parent = Frame
TextBox.Size = UDim2.new(1, -20, 0, 50)
TextBox.Position = UDim2.new(0, 10, 0, 50)
TextBox.PlaceholderText = "Contoh: key1vip"
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.Font = Enum.Font.SourceSans

Button.Parent = Frame
Button.Size = UDim2.new(1, -20, 0, 50)
Button.Position = UDim2.new(0, 10, 0, 110)
Button.Text = "Verify & Load"
Button.BackgroundColor3 = Color3.new(0, 1, 0)
Button.TextColor3 = Color3.new(0, 0, 0)
Button.TextScaled = true
Button.Font = Enum.Font.SourceSansBold

Button.MouseButton1Click:Connect(function()
    local input = TextBox.Text
    if table.find(keys, input) then
        ScreenGui:Destroy()
        -- LOAD CHEAT UTAMA (Ganti URL ini dengan script cheat valid kamu)
        local loadSuccess, loadErr = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/dongakbang2-code/sebatsstore/refs/heads/main/LUA?token=GHSAT0AAAAAADP6AX7BNOE6OEFL3FQHDF3K2JEZWJQ"))()  -- Contoh ESP sederhana untuk test
        end)
        if loadSuccess then
            print("Key valid! Hub loaded.")
        else
            warn("Load cheat gagal: " .. tostring(loadErr))
        end
    else
        TextBox.Text = "Key salah! Coba lagi."
        TextBox.BackgroundColor3 = Color3.new(1, 0.5, 0.5)  -- Merah muda
        wait(2)
        TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
        TextBox.Text = ""
    end
end)
