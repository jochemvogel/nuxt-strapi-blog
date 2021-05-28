<template>
  <div>
    <router-link
      :to="{ name: 'index' }"
      tag="a"
      class="uk-button uk-button-primary"
      >&larr; Go back
    </router-link>
    <div
      v-if="article.thumbnail"
      id="banner"
      class="
        uk-height-small
        uk-flex
        uk-flex-center
        uk-flex-middle
        uk-background-cover
        uk-light
        uk-padding
      "
      :data-src="api_url + article.thumbnail.url"
      uk-img
    ></div>
    <h1>{{ article.title }}</h1>
    <div class="uk-section">
      <div class="uk-container uk-container-small">
        <div v-if="article.content" id="editor">{{ article.content }}</div>
        <p v-if="article.published_at">
          {{ moment(article.published_at).format('MMM Do YYYY') }}
        </p>
      </div>
    </div>
  </div>
</template>
<script>
import articleQuery from '~/apollo/queries/article/article'
const moment = require('moment')
export default {
  data() {
    return {
      article: {},
      moment,
      api_url:
        process.env.PRODUCTION_API_URL || 'http://localhost:1337/graphql',
    }
  },
  apollo: {
    article: {
      prefetch: true,
      query: articleQuery,
      variables() {
        return { id: this.$route.params.id }
      },
    },
  },
}
</script>
