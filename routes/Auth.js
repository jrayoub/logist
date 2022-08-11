const express = require('express');
const router = express.Router();
const {
    CheckIfUserExists,
    login,
    VerifyNumber,
    regester,
    ResendOTP,
    UploadDocument,
    test,
    driverRegester
} = require('../controllers/Auth');

router.get('/CheckIfUserExists', CheckIfUserExists);
router.get('/VerifyNumber', VerifyNumber);
router.post('/', login);
router.post('/test', test);
router.post('/regester', regester);
router.post('/Verify', ResendOTP);
router.post('/driverRegester', driverRegester);
router.post('/UploadDocument', UploadDocument);

module.exports = router;