import Component from '@glimmer/component';
import { modifier } from 'ember-modifier';
import { task } from 'ember-concurrency';

let updateData = modifier((element, [fetchCommentsTask, user]) => {
  fetchCommentsTask.perform(user);
});

export default class UserRoute extends Component {
  fetchCommentsTask = task({ restartable: true }, async (user) => {
    return await user.hasMany('comments').load();
  });

  <template>
    <div {{updateData this.fetchCommentsTask @model}}>
      <p>{{@model.name}}</p>

      {{#if this.fetchCommentsTask.isRunning}}
        Loading comments...
      {{else}}
        {{#each @model.comments as |comment|}}
          {{comment.text}}
        {{/each}}
      {{/if}}
    </div>
  </template>
}
