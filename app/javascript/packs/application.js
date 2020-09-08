import 'bootstrap'
import './src/application.scss'
import './bootstrap_custom.js'
import './items.js'

$(document).ready(function(){
  $('.toast').toast({animation: true, delay: 2000});
  $('.toast').toast('show');
  });