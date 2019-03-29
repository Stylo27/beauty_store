<template>
  <div class='col-md-2'>
    <b-nav vertical>
      <b-nav-item-dropdown
        text="Sort"
        extra-toggle-classes="nav-link-custom"
      >
        <b-dropdown-item>
          <router-link to="/?sort[order_by_name]">Name</router-link>
        </b-dropdown-item>
      </b-nav-item-dropdown>
    </b-nav>
  </div>
</template>
<script>
  export default {
  }
</script>
