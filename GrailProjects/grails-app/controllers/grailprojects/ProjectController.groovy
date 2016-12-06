package grailprojects

class ProjectController {

    def scaffold = true;

    def index =  {

        redirect(action: current)
    }
    def overdue = {
        render " this is another method and I will control my view using this"
    }
    def current = {
       def allProjects = Project.list();
        [allProjects:allProjects];
    }
}
