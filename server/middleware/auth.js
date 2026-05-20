import jwt from 'jsonwebtoken';

const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key';

export const requireAuth = (req, res, next) => {
  try {
    const authHeader = req.headers.authorization || '';
    if (!authHeader.startsWith('Bearer ')) {
      return res.status(401).json({ error: 'Unauthorized' });
    }

    const token = authHeader.slice(7);
    const decoded = jwt.verify(token, JWT_SECRET);

    req.auth = {
      userId: decoded.userId,
      email: decoded.email,
      role: decoded.role || 'employee'
    };

    next();
  } catch (error) {
    return res.status(401).json({ error: 'Invalid token' });
  }
};

export const requireRoles = (...roles) => (req, res, next) => {
  if (!req.auth) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  if (!roles.includes(req.auth.role)) {
    return res.status(403).json({ error: 'Forbidden' });
  }

  next();
};

export const isAdmin = (req) => req.auth?.role === 'admin';
export const isManager = (req) => req.auth?.role === 'manager';
export const isAdminOrManager = (req) => isAdmin(req) || isManager(req);
