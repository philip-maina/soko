export default class ImageSwapperModule {

  $target: JQuery
  $thumb: JQuery

  constructor() {
    // this.$target = $('.vb__ecommerce__productMainImage img')
    // this.$thumb  = $('.vb__ecommerce__productThumb')
  }

  init(){
    $('.vb__ecommerce__productThumb').on('click', function () {
      console.log("I got clicked!!!!!!!")
      $('.vb__ecommerce__productMainImage img').attr(
        'src',
        $(this)
          .find('img')
          .attr('src')
      )
      $('.vb__ecommerce__productThumb').removeClass('border-primary')
      $(this).addClass('border-primary')
    })
  }
}