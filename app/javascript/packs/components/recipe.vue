<template>
  <li class='col-12 my-3'>
    <h6>{{ title }}</h6>
    <p>Difficultée : {{ difficulty }}</p>
    <p>Temps de préparation : {{ preparation_time }}</p>
    <p>Temps de cuisson : {{ cook_time }}</p>
    <span>Liste des ingrédients :</span>
    <p class='multiline'>{{ description }}</p>
  </li>
</template>

<script>
  import axios from 'axios'

  export default {
    name: 'recipe',
    components: {},
    props: {
      title: {
        type: String,
        required: true,
      },
      difficulty: {
        type: String,
        required: true,
      },
      preparation_time: {
        type: String,
        required: true,
      },
      cook_time: {
        type: String,
        required: true,
      },
      description: {
        type: String,
        required: true,
      },
    },
    data() {
      return {
        errored: false,
        error_message: null,
      }
    },

    mounted() {
    },

    methods: {
    },
  }
</script>

<style>
.multiline {
  white-space: pre-wrap;
}
</style>
