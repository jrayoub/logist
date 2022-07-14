const AvatarGenerator = require("named-avatar-generator");


/**
 * 
 * @param {String} name 
 * @description create png avatar for user by initial letter from name and lastname
 * @returns   imag path
 */
function GenrateAvaratByName(name) {
    return new Promise((resolve, reject) => {
        const path = `/img/avatar-${name}-${new Date().getTime()}.jpg`;
        AvatarGenerator.generate({ name: name, size: 64 }).then(avatar => {
            AvatarGenerator.writeAvatar(avatar, `./public${path}`);
            resolve(path);
        }).catch((err) => {
            Log.error(`Error while Generating Avaate by Name : ${name} , err => ${err}`)
            reject(err)
        });
    })
}
module.exports = { GenrateAvaratByName }