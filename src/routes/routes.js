'use strict'

module.exports = (app) => {

    // jobs
    // engineers
    // companies
    const todoList = require("../controllers/engineerController");
    const todoListCompany = require("../controllers/companyController");
    const auth = require("../controllers/authController");
    const authCheck = require("../helpers/authCheck");

    // routes engineer    
    app.route("/api/v1/engineer").get(todoList.getEngineers);
    app.route("/api/v1/engineer/:id").get(todoList.getEngineer);
    app.route("/api/v1/engineer").post(authCheck.engineerCheck, todoList.createEngineer);
    app.route("/api/v1/engineer/:id").put(authCheck.engineerCheck,todoList.updateEngineer);
    app.route("/api/v1/engineer/:id").delete(authCheck.engineerCheck, todoList.deleteEngineer);
    // app.route("/api/v1/engineer").get(todoList.sortEngineer);
    
    // routes company
    app.route("/api/v1/company").get(todoListCompany.getCompanies);
    app.route("/api/v1/company/:id").get(todoListCompany.getCompany);
    app.route("/api/v1/company").post(todoListCompany.createCompany);
    app.route("/api/v1/company/:id").put(todoListCompany.updateCompany);
    app.route("/api/v1/company/:id").delete(todoListCompany.deleteCompany);

    // auth
    app.route("/api/v1/users").get(auth.getUsers);
    app.route("/api/v1/register").post(auth.register)
    app.route("/auth/login").post(auth.login)

};