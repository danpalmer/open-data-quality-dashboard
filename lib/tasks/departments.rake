namespace "import" do

    desc "Departments"
    task :departments => :environment do
        Department.find_or_create_by(name: "Attorney General's Office", publishes_as: "attorney-generals-office")
        Department.find_or_create_by(name: "Cabinet Office", publishes_as: "cabinet-office")
        Department.find_or_create_by(name: "Department for Business, Innovation & Skills", publishes_as: "department-for-business-innovation-and-skills")
        Department.find_or_create_by(name: "Department for Communities and Local Government", publishes_as: "department-for-communities-and-local-government")
        Department.find_or_create_by(name: "Department for Culture, Media & Sport", publishes_as: "department-for-culture-media-and-sport")
        Department.find_or_create_by(name: "Department for Education", publishes_as: "department-for-education")
        Department.find_or_create_by(name: "Department for Environment, Food & Rural Affairs", publishes_as: "department-for-environment-food-and-rural-affairs")
        Department.find_or_create_by(name: "Department for International Development", publishes_as: "department-for-international-development")
        Department.find_or_create_by(name: "Department for Transport", publishes_as: "department-for-transport")
        Department.find_or_create_by(name: "Department for Work and Pensions", publishes_as: "department-for-work-and-pensions")
        Department.find_or_create_by(name: "Department of Energy & Climate Change", publishes_as: "department-of-energy-and-climate-change")
        Department.find_or_create_by(name: "Department of Health", publishes_as: "department-of-health")
        Department.find_or_create_by(name: "Foreign & Commonwealth Office", publishes_as: "foreign-and-commonwealth-office")
        Department.find_or_create_by(name: "HM Treasury", publishes_as: "her-majestys-treasury")
        Department.find_or_create_by(name: "Home Office", publishes_as: "home-office")
        Department.find_or_create_by(name: "Ministry of Defence", publishes_as: "ministry-of-defence")
        Department.find_or_create_by(name: "Ministry of Justice", publishes_as: "ministry-of-justice")
        Department.find_or_create_by(name: "Northern Ireland Office", publishes_as: "northern-ireland-office")
        Department.find_or_create_by(name: "Office of the Advocate General for Scotland", publishes_as: "office-of-the-advocate-general-of-scotland")
        Department.find_or_create_by(name: "Office of the Leader of the House of Commons", publishes_as: "")
        Department.find_or_create_by(name: "Office of the Leader of the House of Lords", publishes_as: "")
        Department.find_or_create_by(name: "Scotland Office", publishes_as: "scotland-office")
        Department.find_or_create_by(name: "UK Export Finance", publishes_as: "united-kingdom-export-finance")
        Department.find_or_create_by(name: "Wales Office", publishes_as: "wales-office")
    end

end
