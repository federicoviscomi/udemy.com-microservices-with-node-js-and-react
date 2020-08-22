import mongoose from 'mongoose';

interface UserAttrs {
  email: string;
  password: string;
}

interface UserModel extends mongoose.Model<any> {
  build(attrs: UserAttrs): any;
}

interface UserDoc extends mongoose.Document {
  email: string;
  password: string;
}

const userSchema = new mongoose.Schema({
    email: {
      type: String,
      required: true
    },
    password: {
      type: String,
      required: true
    },
  },
  {
    toJSON: {
      transform(doc, ret) {
        delete ret.password;
        delete ret.__v;
      }
    }
  });
userSchema.statics.build = (attrs: UserAttrs) => {
  return new User(attrs);
};

const User = mongoose.model<any, UserModel>('User', userSchema);

const buildUser = (attrs: UserAttrs) => {
  return new User(attrs);
};

export {User, buildUser};