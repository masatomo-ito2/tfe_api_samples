resource "random_pet" "pet" {
	keepers = { 
		val = timestamp()
	}
}

output "pet" {
	value = random_pet.pet.id
}
