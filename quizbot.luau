-- Load OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Load your quiz data
local QuizData = loadstring(game:HttpGet("https://raw.githubusercontent.com/SmilerVinix/N3Tower/main/quizbot.luau"))()
local Questions = QuizData.N3TowerQuiz.Questions

-- Create Window
local Window = OrionLib:MakeWindow({
	Name = "🧠 N3Tower Quiz",
	HidePremium = false,
	IntroText = "Welcome to N3Tower",
	SaveConfig = false
})

-- Create Tab
local QuizTab = Window:MakeTab({
	Name = "Quiz Time",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Function to display a question
local function DisplayQuestion(index)
	local q = Questions[index]
	QuizTab:AddParagraph("❓ Question", q.Question)

	for _, answer in ipairs(q.Answers) do
		QuizTab:AddButton({
			Name = "Answer: " .. answer,
			Callback = function()
				OrionLib:MakeNotification({
					Name = "Answer Selected",
					Content = "You chose: " .. answer,
					Time = 3
				})
			end
		})
	end
end

-- Add each question
for i = 1, #Questions do
	DisplayQuestion(i)
end

-- GUI Loaded
OrionLib:Init()
