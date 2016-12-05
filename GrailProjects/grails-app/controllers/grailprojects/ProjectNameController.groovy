package grailprojects

class ProjectNameController {

    def index =  {

        redirect(action: current)
    }
    def overdue = {
        render " this is another method and I will control my view using this"
    }
    def current = {
       def allProjects = ProjectName.list();
        [allProjects:allProjects];
        // [project: projectName, date: dueDate]
    }
}
