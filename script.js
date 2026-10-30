const bcrypt = require('bcrypt');

async function generateHash() {
    const saltRounds = 10;
    const plainPassword = 'Raoul@123';
    const hash = await bcrypt.hash(plainPassword, saltRounds);
    console.log(hash);
}

generateHash();