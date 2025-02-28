import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class IndexRoute extends Route {
  @service store;

  beforeModel() {
    this.store.createRecord('user', { name: 'Abel' });
    this.store.createRecord('user', { name: 'Bart' });
  }
}
