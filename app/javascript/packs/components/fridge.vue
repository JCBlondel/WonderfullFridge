<template>
  <div class='col-12 my-3'>
    <h2>Contenu du frigo</h2>
    <form onsubmit='return false' id='ingredient_form'></form>
    <div class='row'>
      <input class='col-12' placeholder='Ingrédients séparés par un espace' v-model='ingredients' form='ingredients_form' required/>
      <div class='col-12 my-3'>
        <button type='submit' class='btn btn-primary' form='ingredients_form' @click="search_recipes" >Rechercher</button>
      </div>
    </div> 

    <h2>Recettes possibles</h2>
    <ul class='row' v-if='recipes.length'>
      <Recipe
        v-for='(recipe, index) in recipes'
        :key='recipe.name + index'
        :title='recipe.name'
        :difficulty='recipe.difficulty'
        :preparation_time='recipe.preparation_time'
        :cook_time='recipe.cook_time'
        :description='recipe.description'
      />
    </ul>
    <div v-else>
      <p>Aucune recette ne peut être préparée à partir des ingrédients listés, n'oubliez pas les épices.</p>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import Recipe from './recipe'

  export default {
    name: 'fridge',
    components: { Recipe },
    props: {},
    data() {
      return {
        errored: false,
        error_message: null,

        ingredients: [],
        recipes : []
      }
    },

    mounted() {
    },

    methods: {
      search_recipes() {
        const url = "http://" + window.location.host + "/api/v1/recipes"
        const token = document.querySelector('[name=csrf-token]').content
        axios.defaults.headers.common['X-CSRF-TOKEN'] = token

        if (this.ingredients.length) {
          axios
            .get(url, { params: { ingredients: this.ingredients } })
            .then(response => {
              this.recipes = response['data']
            })
            .catch(error => {
              this.error_message = error.response
              this.errored = true
            })
        }
      },
    },
  }
</script>

<style>
</style>
