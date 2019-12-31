const con = require('../config/conn')

module.exports = {
    getEngineer: (id)=>{
        return new Promise((resolve, reject)=>{
            con.query(`Select * from engineer where id='${id}'`, (err, result)=>{
                if(err){
                    reject(new Error(err))
                }else{
                    resolve(result)
                }
            })
        })
    },

    getEngineers : (limit, offset, condition)=>{
        return new Promise((resolve, reject)=>{
            con.query(`SELECT COUNT(*) as data from engineer ${condition}`, (err, rows)=>{
                let dataTotal = rows[0].data
                if(err){
                    resolve.json({
                        err
                    })
                }else{
                    con.query(`SELECT * FROM engineer ${condition} limit ${offset}, ${limit}`, (err, data)=>{
                        if(err){
                            reject(new Error(err))
                        }else{
                            let result = {dataTotal, data}
                            resolve(result)
                        }
                    })
                } 
            })
        })
    },
        // create engineer
        createEngineer: (data) => {
        return new Promise((resolve, reject) => {
            con.query('INSERT INTO engineer SET ?', data, (err, result) => {
                if (!err) {
                    resolve(result)
                }else {
                    reject(new Error(err))
                }
            })
        })
    },
        // update engineer
        updateEngineer: (data, id) => {
        return new Promise((resolve, reject) => {
            con.query("UPDATE engineer SET ? where id = ?", [id, data], (err, result) => {
                if (!err) {
                    resolve(result)
                }else {
                    reject(new Error(err))
                }
            })
        })
    },
        // delete engineer
        deleteEngineer: (id) => {
        return new Promise((resolve, reject) => {
            con.query("DELETE FROM engineer WHERE id = ?", id, (err, result) => {
                if (!err) {
                    resolve(result)
                }else {
                    reject(new Error(err))
                }
            })
            con.query("DELETE FROM users WHERE id = ?", id, (err, result) => {
                if (!err) {
                    resolve(result)
                }else {
                    reject(new Error(err))
                }
            })
        })
    },

}