-- SwkuHud Loading Screen v2.0
-- Animated Loading Screen with Effects

local function CreateLoadingScreen()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    
    -- Create Main UI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SwkuHudLoader"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999999
    ScreenGui.IgnoreGuiInset = true  -- WICHTIG: Fullscreen über TopBar
    
    -- Background Blur
    local BlurFrame = Instance.new("Frame")
    BlurFrame.Name = "BlurBackground"
    BlurFrame.Size = UDim2.new(1, 0, 1, 36)  -- 36 pixels extra für TopBar
    BlurFrame.Position = UDim2.new(0, 0, 0, -36)  -- Start bei -36 für TopBar
    BlurFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    BlurFrame.BackgroundTransparency = 0
    BlurFrame.BorderSizePixel = 0
    BlurFrame.Parent = ScreenGui
    
    -- Gradient Background
    local GradientFrame = Instance.new("Frame")
    GradientFrame.Size = UDim2.new(1, 0, 1, 0)
    GradientFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    GradientFrame.BorderSizePixel = 0
    GradientFrame.Parent = BlurFrame
    
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 25)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 0, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 25))
    })
    UIGradient.Rotation = 45
    UIGradient.Parent = GradientFrame
    
    -- Animated Gradient
    spawn(function()
        local rotation = 0
        while ScreenGui.Parent do
            rotation = rotation + 1
            UIGradient.Rotation = rotation % 360
            RunService.RenderStepped:Wait()
        end
    end)
    
    -- Center Container
    local Container = Instance.new("Frame")
    Container.Name = "LoadingContainer"
    Container.Size = UDim2.new(0, 400, 0, 300)
    Container.AnchorPoint = Vector2.new(0.5, 0.5)
    Container.Position = UDim2.new(0.5, 0, 0.5, 0)
    Container.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    Container.BorderSizePixel = 0
    Container.Parent = BlurFrame
    
    local ContainerCorner = Instance.new("UICorner")
    ContainerCorner.CornerRadius = UDim.new(0, 12)
    ContainerCorner.Parent = Container
    
    local ContainerStroke = Instance.new("UIStroke")
    ContainerStroke.Color = Color3.fromRGB(100, 0, 200)
    ContainerStroke.Thickness = 2
    ContainerStroke.Transparency = 0.5
    ContainerStroke.Parent = Container
    
    -- Logo/Title
    local Logo = Instance.new("TextLabel")
    Logo.Name = "Logo"
    Logo.Size = UDim2.new(1, -20, 0, 60)
    Logo.Position = UDim2.new(0, 10, 0, 20)
    Logo.BackgroundTransparency = 1
    Logo.Font = Enum.Font.SourceSansBold
    Logo.Text = "SWKU HUD"
    Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    Logo.TextScaled = true
    Logo.TextStrokeTransparency = 0.5
    Logo.TextStrokeColor3 = Color3.fromRGB(100, 0, 200)
    Logo.Parent = Container
    
    -- Version Label
    local Version = Instance.new("TextLabel")
    Version.Name = "Version"
    Version.Size = UDim2.new(1, -20, 0, 20)
    Version.Position = UDim2.new(0, 10, 0, 85)
    Version.BackgroundTransparency = 1
    Version.Font = Enum.Font.SourceSans
    Version.Text = "v2.0 | Premium Edition"
    Version.TextColor3 = Color3.fromRGB(150, 150, 200)
    Version.TextScaled = true
    Version.Parent = Container
    
    -- Loading Bar Background
    local LoadingBarBG = Instance.new("Frame")
    LoadingBarBG.Name = "LoadingBarBG"
    LoadingBarBG.Size = UDim2.new(0.8, 0, 0, 8)
    LoadingBarBG.Position = UDim2.new(0.1, 0, 0.5, 0)
    LoadingBarBG.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    LoadingBarBG.BorderSizePixel = 0
    LoadingBarBG.Parent = Container
    
    local LoadingBarCorner = Instance.new("UICorner")
    LoadingBarCorner.CornerRadius = UDim.new(0, 4)
    LoadingBarCorner.Parent = LoadingBarBG
    
    -- Loading Bar Progress
    local LoadingBar = Instance.new("Frame")
    LoadingBar.Name = "LoadingBar"
    LoadingBar.Size = UDim2.new(0, 0, 1, 0)
    LoadingBar.Position = UDim2.new(0, 0, 0, 0)
    LoadingBar.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
    LoadingBar.BorderSizePixel = 0
    LoadingBar.Parent = LoadingBarBG
    
    local LoadingBarCorner2 = Instance.new("UICorner")
    LoadingBarCorner2.CornerRadius = UDim.new(0, 4)
    LoadingBarCorner2.Parent = LoadingBar
    
    local LoadingBarGradient = Instance.new("UIGradient")
    LoadingBarGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 255))
    })
    LoadingBarGradient.Parent = LoadingBar
    
    -- Status Text
    local StatusText = Instance.new("TextLabel")
    StatusText.Name = "Status"
    StatusText.Size = UDim2.new(1, -20, 0, 20)
    StatusText.Position = UDim2.new(0, 10, 0.5, 20)
    StatusText.BackgroundTransparency = 1
    StatusText.Font = Enum.Font.SourceSans
    StatusText.Text = "Initializing..."
    StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
    StatusText.TextScaled = true
    StatusText.Parent = Container
    
    -- Features List
    local Features = Instance.new("TextLabel")
    Features.Name = "Features"
    Features.Size = UDim2.new(1, -20, 0, 80)
    Features.Position = UDim2.new(0, 10, 0, 200)
    Features.BackgroundTransparency = 1
    Features.Font = Enum.Font.SourceSans
    Features.Text = "• ESP System • Auto Farm\n• Gun Grab • Event Modes\n• Mass Teleport • Anti-Kick"
    Features.TextColor3 = Color3.fromRGB(150, 150, 180)
    Features.TextScaled = true
    Features.TextYAlignment = Enum.TextYAlignment.Center
    Features.Parent = Container
    
    -- Particles Effect
    local function createParticle()
        local Particle = Instance.new("Frame")
        Particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
        Particle.Position = UDim2.new(math.random(), 0, 1, 0)
        Particle.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
        Particle.BorderSizePixel = 0
        Particle.Parent = BlurFrame
        
        local ParticleCorner = Instance.new("UICorner")
        ParticleCorner.CornerRadius = UDim.new(1, 0)
        ParticleCorner.Parent = Particle
        
        local moveTween = TweenService:Create(
            Particle,
            TweenInfo.new(math.random(3, 6), Enum.EasingStyle.Linear),
            {Position = UDim2.new(math.random(), 0, -0.1, 0), Transparency = 1}
        )
        
        moveTween:Play()
        moveTween.Completed:Connect(function()
            Particle:Destroy()
        end)
    end
    
    -- Spawn particles
    spawn(function()
        while ScreenGui.Parent do
            createParticle()
            wait(0.2)
        end
    end)
    
    -- Loading Animation
    local loadingSteps = {
        {0.1, "Loading assets..."},
        {0.2, "Initializing ESP..."},
        {0.3, "Setting up UI..."},
        {0.4, "Loading player data..."},
        {0.5, "Configuring features..."},
        {0.6, "Establishing connections..."},
        {0.7, "Loading scripts..."},
        {0.8, "Finalizing setup..."},
        {0.9, "Almost ready..."},
        {1.0, "Launching Swku HUD!"}
    }
    
    -- Animate loading
    spawn(function()
        for _, step in ipairs(loadingSteps) do
            local progress, status = step[1], step[2]
            
            -- Update status
            StatusText.Text = status
            
            -- Animate progress bar
            local tween = TweenService:Create(
                LoadingBar,
                TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                {Size = UDim2.new(progress, 0, 1, 0)}
            )
            tween:Play()
            
            wait(0.5)
        end
        
        -- Pulse effect when complete
        local pulseIn = TweenService:Create(
            Container,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad),
            {Size = UDim2.new(0, 420, 0, 320)}
        )
        local pulseOut = TweenService:Create(
            Container,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad),
            {Size = UDim2.new(0, 400, 0, 300)}
        )
        
        pulseIn:Play()
        pulseIn.Completed:Connect(function()
            pulseOut:Play()
        end)
        
        wait(0.5)
        
        -- Fade out
        local fadeOut = TweenService:Create(
            BlurFrame,
            TweenInfo.new(1, Enum.EasingStyle.Quad),
            {BackgroundTransparency = 1}
        )
        
        for _, obj in pairs(BlurFrame:GetDescendants()) do
            if obj:IsA("Frame") then
                TweenService:Create(obj, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
            elseif obj:IsA("TextLabel") then
                TweenService:Create(obj, TweenInfo.new(1), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
            elseif obj:IsA("UIStroke") then
                TweenService:Create(obj, TweenInfo.new(1), {Transparency = 1}):Play()
            end
        end
        
        fadeOut:Play()
        wait(1.5)
        
        -- Load actual HUD (Passe hier den Link zu deinem SwkuHud an!)
        -- loadstring(game:HttpGet("https://raw.githubusercontent.com/SwuskU/SwkuHud/main/SwkuHud.lua"))()
        
        -- Cleanup
        ScreenGui:Destroy()
    end)
    
    -- Add to PlayerGui
    if LocalPlayer.PlayerGui then
        ScreenGui.Parent = LocalPlayer.PlayerGui
    else
        ScreenGui.Parent = game:GetService("CoreGui")
    end
    
    return ScreenGui
end

-- Return the loading screen
return CreateLoadingScreen()
