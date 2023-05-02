import { Router } from 'express';
import { type Request, type Response, type NextFunction } from 'express';
import { driver } from '../helpers/driver';

const router = Router();
router.post('/', async (req: Request, res: Response, _next: NextFunction) => {
  const session = driver.session();
  const { user_name: userName } = req.body;
  try {
    const query = `
    CREATE (:User { name: $userName })
    `;
    await session.run(query, { userName });
    res.status(204).send();
  } catch (error) {
    console.error(error);
    res.status(500).json({ status: 500, message: 'Internal server error'});
  } finally {
    await session.close();
  }
});

router.patch(
  '/:user_name/assign',
  async (req: Request, res: Response, _next: NextFunction) => {
    const session = driver.session();
    const { user_name: userName } = req.params;
    const { course_name: courseName } = req.body;
    try {
      const query = `
        MATCH (u:User), (c: Course)
        WHERE u.name = $userName AND c.name = $courseName
        CREATE (u)-[r:ASSIGNED]->(c)
        RETURN u,r,c
      `;
      const { records } = await session.run(query, {
        userName,
        courseName,
      });
      res.status(200).send(records);
    } catch (error) {
      console.error(error);
      res.status(500).json({ status: 500, message: 'Internal server error' });
    } finally {
      await session.close();
    }
  }
);

router.delete('/:user_name', async (req: Request, res: Response, _next: NextFunction) => {
  const session = driver.session();
  const { user_name: userName } = req.params;
  try {
    const query = `
      MATCH (u:User { name: $userName })
      DETACH DELETE u
    `;
    await session.run(query, { userName });
    res.status(200).send();
  } catch (error) {
    console.error(error);
    res.status(500).json({ status: 500, message: 'Internal server error' });
  } finally {
    await session.close();
  }
});

export default router;