//: ![Chain of Responsibility](ChainOfResponsibility.png)

// Master
var steve = Mechanic(skill: .MasterMechanic, name: "Steve")
var joe = Mechanic(skill: .MasterMechanic, name: "Joe")
var jack = Mechanic(skill: .MasterMechanic, name: "Jack")
var brian = Mechanic(skill: .MasterMechanic, name: "Drake")


var masterMechanics = MechanicSkillGroup(
    skill: .MasterMechanic,
    mechanics: [steve, joe, jack, brian],
    nextLevel: nil
)

// Apprentice
var tyson = Mechanic(skill: .Apprentice, name: "Tyson")
var tina = Mechanic(skill: .Apprentice, name: "Tina")
var bryan = Mechanic(skill: .Apprentice, name: "Bryan")
var lina = Mechanic(skill: .Apprentice, name: "Lina")

var apprenticeMechanics = MechanicSkillGroup(
    skill: .Apprentice,
    mechanics: [tyson, tina, bryan, lina],
    nextLevel: masterMechanics
)

// Junior
var kenny = Mechanic(skill: .Junior, name: "Kenny")
var matt = Mechanic(skill: .Junior, name: "Matt")
var jerry = Mechanic(skill: .Junior, name: "Jerry")
var tom = Mechanic(skill: .Junior, name: "Tom")

var juniorMechanics = MechanicSkillGroup(
    skill: .Junior,
    mechanics: [kenny, matt, jerry, tom],
    nextLevel: apprenticeMechanics
)

// Nows nothing
var johnSnow = Mechanic(skill: .OilChangeOnly, name: "John Snow")

var oilChangeOnlyes = MechanicSkillGroup(
    skill: .OilChangeOnly,
    mechanics: [johnSnow],
    nextLevel: juniorMechanics
)

// Action
var shop = Shop(firstMechanics: oilChangeOnlyes)

var jobs = [Job(minSkill: .Junior, name: "Windshield Wipers"),
            Job(minSkill: .Apprentice, name: "Light Bulb Change"),
            Job(minSkill: .Apprentice, name: "Battery Replacement"),
            Job(minSkill: .OilChangeOnly, name: "General Oil Change"),
            Job(minSkill: .OilChangeOnly, name: "General Oil Change"),
            Job(minSkill: .OilChangeOnly, name: "General Oil Change"),
            Job(minSkill: .OilChangeOnly, name: "General Oil Change"),
            Job(minSkill: .MasterMechanic, name: "Timing Belt Replacement"),
            Job(minSkill: .Junior, name: "Brake Pads Replacement")
]

for job in jobs{
    shop.performJob(job: job)
}

//: [Next](@next)
