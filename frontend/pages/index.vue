<template>
  <div>
    <h1>Tasty Food</h1>
    <!-- Article cards -->
    <div
      v-for="article in articles"
      :key="article"
      class="
        uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@m uk-margin
      "
      uk-grid
    >
      <div>
        <div class="uk-card-body">
          <h3 class="uk-card-title">{{ article.title }}</h3>
          <p>{{ article.content }}</p>
          <!-- Link to the article using router-link -->
          <router-link
            :to="{ name: 'id', params: { id: article.id } }"
            tag="a"
            class="uk-button uk-button-primary"
            >View article
          </router-link>
        </div>
      </div>
    </div>
    <!-- If no articles have been found -->
    <div
      v-if="articles.length == 0"
      class="uk-container uk-container-center uk-text-center"
    >
      <p>No articles found</p>
    </div>
  </div>
</template>
<script>
// Import the articles query
import articlesQuery from '~/apollo/queries/article/articles'
export default {
  data() {
    return {
      // Initialize an empty articles variable
      articles: [],
      query: '',
    }
  },
  apollo: {
    articles: {
      prefetch: true,
      query: articlesQuery,
    },
  },
}
</script>
