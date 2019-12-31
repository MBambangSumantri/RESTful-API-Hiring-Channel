const con = require('../config/conn')

module.exports = {

    // view company table
    getCompany: (id) => {
        return new Promise((resolve, reject) => {
            con.query(`SELECT * FROM company where id='${id}'`, (err, result) => {
                if (err) {
                  reject(new Error(err));
                } else {
                  resolve(result);
                }
            })
        })
    },

    getCompanies : (limit, offset, condition)=>{
        return new Promise((resolve, reject)=>{
            con.query(`SELECT COUNT(*) as data from company ${condition}`, (err, rows)=>{
                let dataTotal = rows[0].data
                if(err){
                    resolve.json({
                        err
                    })
                }else{
                    con.query(`SELECT * FROM company ${condition} limit ${offset}, ${limit}`, (err, data)=>{
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

    // insert company
    createCompany: (data) => {
        return new Promise((resolve, reject) => {
            con.query("INSERT INTO company SET ?", data, (err, result) => {
                if (!err) {
                    resolve(result)
                }else {
                    reject(new Error(err))
                }
            })
        })
    },

    // update company
        updateCompany: (data, id) => {
        return new Promise((resolve, reject) => {
            con.query("UPDATE company SET ? where id = ?", [id, data], (err, result) => {
                if (!err) {
                    resolve(result)
                }else {
                    reject(new Error(err))
                }
            })
        })
    },

    // update company
        deleteCompany: (id) => {
        return new Promise((resolve, reject) => {
            con.query("DELETE FROM company WHERE id = ?", id, (err, result) => {
                if (!err) {
                    resolve(result)
                }else {
                    reject(new Error(err))
                }
            })
        })
    },
}