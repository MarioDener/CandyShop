<section id="recomendados" class="col-md-2 col-lg-2 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12"><?php if (isset($_SESSION["usuario"])) { ?><h4><?=(isset($_SESSION['idioma']) && $_SESSION['idioma']=="EN")?$language['english']['label_recomendados_para_ti']:$language['spanish']['label_recomendados_para_ti']?></h4><?php } ?></section>