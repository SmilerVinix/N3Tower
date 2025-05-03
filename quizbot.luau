-- N3Tower QuizBot by SmilerVinix
-- Original by Damian-11

local CustomCategoryManager = {}

function CustomCategoryManager.New(categoryName)
	local self = {}
	self.CategoryName = categoryName
	self.Questions = {}

	function self:Add(question, answers)
		table.insert(self.Questions, {
			Question = question,
			Answers = answers
		})
	end

	function self:Get()
		return {
			Name = self.CategoryName,
			Questions = self.Questions
		}
	end

	return self
end

-- Create your custom category
local n3Category = CustomCategoryManager.New("N3Tower Trivia")

-- Add your questions here
n3Category:Add("What does 'N3' stand for?", {"Next-Gen 3", "Node 3", "Nothing 3", "Network 3"})
n3Category:Add("Who created N3Tower?", {"SmilerVinix", "Damian-11", "OpenAI", "Roblox"})
n3Category:Add("What platform is N3Tower made for?", {"Roblox", "Unity", "Godot", "Scratch"})

-- Export the quiz data
return {
	N3TowerQuiz = n3Category:Get()
}
