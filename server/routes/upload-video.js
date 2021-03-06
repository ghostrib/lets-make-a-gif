module.exports = (app) => {
  const router = require('express').Router();
  const { videoUpload } = require('../config');
  const { handleVideoStream } = require('../../api');

  router.post('/', videoUpload.single('file'), async (req, res, next) => {
    await handleVideoStream(req, res, next);
  });

  app.use('/upload-video', router);
};
