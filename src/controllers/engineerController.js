const uuidv4 = require('uuid/v4')
const multer = require('multer')
const path = require("path")
const engineerModels = require("../models/engineerModel")
// const miscHelper = require('../helpers/misc')
const helpers = require("../helpers/helpers")
require("dotenv").config()
const base_url = process.env.BASE_URL;

// multer
const storage = multer.diskStorage({
    destination: (req,file,cb) => {
        cb(null, './images/engineer')
    },
    filename: (req, file, cb) => {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})

//init upload
const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1*1024*1024
    },
    fileFilter: helpers.imageFilter
}).single('photo')

module.exports = {
getEngineer: (req, res)=>{
        let id = req.params.id
        engineerModels.getEngineer(id)
            .then(result=>{
                res.status(200).json({
                    error: false,
                    result
                })
            })
            .catch(err=>{
                res.status(400).json({
                    error:true,
                    err
                })
            })
    },

getEngineers:(req, res)=>{
        const page = parseInt(req.query.page) || 1
        const limit = parseInt(req.query.limit) || 12
        const offset = (page-1)*limit
        const sort = req.query.sort ? req.query.sort : 'name'
        const order = req.query.order || 'asc'
        const name = req.query.name
        const skill = req.query.skill
        let condition = ''
        let url = req.originalUrl
        const pageDetail = {

        }

        if(!name){
            condition = "where skill like '%"+skill+"%' order by "+sort+" "+order
        }
        if(!skill){
            condition = "where name like '%"+name+"%' order by "+sort+" "+order
        }
        if(name && skill){
            condition = "where name like '%"+name+"% or skill like '%"+skill+"%' order by "+sort+" "+order
        }
        if(!name && !skill){
            condition = "order by "+sort+" "+order
        }

        let nextPage = process.env.BASE_URL+url.replace(`page=${page}`, 'page='+parseInt(page+1))
        let prevPage = process.env.BASE_URL+url.replace(`page=${page}`, 'page='+parseInt(page-1))
 
        engineerModels.getEngineers(limit, offset, condition)
        .then(result=>{
            let pageTotal = result.dataTotal%limit===0?result.dataTotal/limit:Math.floor((result.dataTotal/limit)+1)
            if(page>pageTotal || page===0){
                res.status(404).json({
                    error: true,
                    message: '404 Page Not Found!'
                })
            }
            if(page===1&&pageTotal!==1){
                res.status(200).json({
                    error: false,
                    page,
                    nextPage,
                    limit,
                    totalData: result.dataTotal,
                    totalPage: pageTotal,
                    result
                })
            }else if(page===pageTotal&&pageTotal!==1){
                res.status(200).json({
                    error: false,
                    page,
                    prevPage,
                    limit,
                    totalData: result.dataTotal,
                    totalPage: pageTotal,
                    result
                })
            }else if(pageTotal===1){
                res.status(200).json({
                    error: false,
                    page,
                    limit,
                    totalData: result.dataTotal,
                    totalPage: pageTotal,
                    result
                })
            }else{
                // return miscHelper.response(res, 200, false, 'Success', result)
                res.status(200).json({
                    error: false,
                    page,
                    nextPage,
                    prevPage,
                    limit,
                    totalData: result.dataTotal,
                    totalPage: pageTotal,
                    result
                })
            }
            
        })
        .catch(err=>{
            res.status(400).json({
                error:true,
                message: err
            })
        })
    },

// create Engineer
createEngineer : (req, res)=>{
      upload(req, res, (err)=>{
         if(req.fileValidationError){
            res.status(400).json({
               error : true,
               message: 'Only image files are allowed!'
            })
         }else if(err){
            res.status(400).json({
               message: err
            })
         }else{
            const {name, email, description, expectsalary, skill, location, dateofbirth, showcase } = req.body
            const id = uuidv4()
            const photo = req.file ? req.file.filename : req.file
            const datecreate = new Date()
            const dateupdated = new Date()
            const data = {id, name, photo, email, description, expectsalary, skill, location, dateofbirth, showcase, datecreate, dateupdated}

            engineerModels.createEngineer(data)
               .then(result=>{
                   console.log(result)
                  res.status(200).json({
                     error: false,
                     data,
                     result,
                     message: "success add engineer!"
                  })
               })
               .catch(err=>{
                  console.log(err)
                  res.status(400).json({
                     error:true,
                     message: err
                  })
               })
            }
         })
      },

// update engineer
updateEngineer: (req, res) => {
upload(req, res, (err) => {
const { name, email, description, expectsalary, skill, location, dateofbirth, showcase } = req.body;
const dateupdated = new Date();
const id = req.params.id;
const photo = req.file ? req.file.filename : req.file;
const data = { name, photo, email, description, expectsalary, skill, location, dateofbirth, showcase, dateupdated };

engineerModels.updateEngineer(id, data)
    .then(result => {
        res.status(200).json({
            error: false,
            message: result
            })
         })
         .catch(err=>{
            res.status(400).json({
            error: true,
            message: err
        })   
    })
})
},

// delete engineer
deleteEngineer: (req, res) => {
const id = req.params.id;
engineerModels.deleteEngineer(id)
    .then(result => {
        res.status(201).json({
        status: 201,
        err: false,
        message: "Engineer have been deleted" 
        })
    })
    .catch(err => {
        res.status(400).json({
        status: 400,
        err: true,
        message: err
        })
    })
},

}