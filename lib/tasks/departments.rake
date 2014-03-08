namespace "import" do

    desc "Departments"
    task :departments => :environment do
        Department.find_or_create_by(name: "Attorney General's Office")
        Department.find_or_create_by(name: "Cabinet Office")
        Department.find_or_create_by(name: "Department for Business, Innovation & Skills")
        Department.find_or_create_by(name: "Department for Communities and Local Government")
        Department.find_or_create_by(name: "Department for Culture, Media & Sport")
        Department.find_or_create_by(name: "Department for Education")
        Department.find_or_create_by(name: "Department for Environment, Food & Rural Affairs")
        Department.find_or_create_by(name: "Department for International Development")
        Department.find_or_create_by(name: "Department for Transport")
        Department.find_or_create_by(name: "Department for Work and Pensions")
        Department.find_or_create_by(name: "Department of Energy & Climate Change")
        Department.find_or_create_by(name: "Department of Health")
        Department.find_or_create_by(name: "Foreign & Commonwealth Office")
        Department.find_or_create_by(name: "HM Treasury")
        Department.find_or_create_by(name: "Home Office")
        Department.find_or_create_by(name: "Ministry of Defence")
        Department.find_or_create_by(name: "Ministry of Justice")
        Department.find_or_create_by(name: "Northern Ireland Office")
        Department.find_or_create_by(name: "Office of the Advocate General for Scotland")
        Department.find_or_create_by(name: "Office of the Leader of the House of Commons")
        Department.find_or_create_by(name: "Office of the Leader of the House of Lords")
        Department.find_or_create_by(name: "Scotland Office")
        Department.find_or_create_by(name: "UK Export Finance")
        Department.find_or_create_by(name: "Wales Office")
    end

end
