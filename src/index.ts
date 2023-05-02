
import 'dotenv/config';
import Express from 'express';
import StudentRouter from './routes/student';

const app = Express();

app.use(Express.json())
app.use('/student', StudentRouter);

const PORT = process.env.PORT || 3300;
app.listen(PORT, () => {
  console.log(`Servidor Express corriendo en el puerto ${PORT}`);
});
