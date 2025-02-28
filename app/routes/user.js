import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class IndexRoute extends Route {
  @service store;

  model({ user_id }) {
    console.log(user_id, this.store.peekAll('user'));
    return this.store.peekAll('user').find((user) => {
      return user.name.toLowerCase() === user_id.toLowerCase();
    });
  }
}
