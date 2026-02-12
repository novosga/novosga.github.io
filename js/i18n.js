(function () {
  var translations = {
    'pt-br': {
      hosting_banner: 'Conheça a <a href="https://novosga.com/?utm_source=novosga&utm_medium=banner" target="_blank">hospedagem profissional do NovoSGA</a>.',
      nav_docs: 'Documentação',
      subtitle: 'Sistema de <strong>gerenciamento de fila</strong> de atendimento',
      feature_fast_title: '<strong>Rápido</strong>',
      feature_fast_desc: '<strong>Rápido</strong> de instalar, <strong>rápido</strong> de usar',
      feature_extensible_title: '<strong>Estensível</strong>',
      feature_extensible_desc: 'Aplicação construída em <strong>módulos</strong>',
      feature_modern_title: '<strong>Moderno</strong>',
      feature_modern_desc: 'Uso de <strong>tecnologias web</strong> modernas',
      feature_free_title: '<strong>Grátis</strong>',
      feature_free_desc: 'Código-aberto disponível no <strong>GitHub</strong>',
      getting_started: 'Começar',
      docs_btn: '<strong>Documentação</strong>',
      hosting_btn: 'Hospedagem',
      contribute_btn: 'Contribua',
      footer: '<strong>NovoSGA</strong> by <a href="https://mangati.com" target="_blank">Mangati</a>. Todo o código-fonte está sob licença <a href="http://opensource.org/licenses/mit-license.php">MIT</a>.',
      banner_developed: 'Desenvolvido e mantido por <a href="https://mangati.com" target="_blank">Mangati</a>',
      docs_link: '/docs/'
    },
    en: {
      hosting_banner: 'Check out the <a href="https://novosga.com/?utm_source=novosga&utm_medium=banner" target="_blank">professional NovoSGA hosting</a>.',
      nav_docs: 'Documentation',
      subtitle: 'A <strong>queue management</strong> system',
      feature_fast_title: '<strong>Fast</strong>',
      feature_fast_desc: '<strong>Fast</strong> to install, <strong>fast</strong> to use',
      feature_extensible_title: '<strong>Extensible</strong>',
      feature_extensible_desc: 'Application built in <strong>modules</strong>',
      feature_modern_title: '<strong>Modern</strong>',
      feature_modern_desc: 'Using modern <strong>web technologies</strong>',
      feature_free_title: '<strong>Free</strong>',
      feature_free_desc: 'Open-source available on <strong>GitHub</strong>',
      getting_started: 'Getting started',
      docs_btn: '<strong>Documentation</strong>',
      hosting_btn: 'Hosting',
      contribute_btn: 'Contribute',
      footer: '<strong>NovoSGA</strong> by <a href="https://mangati.com" target="_blank">Mangati</a>. All source code is licensed under <a href="http://opensource.org/licenses/mit-license.php">MIT</a>.',
      banner_developed: 'Developed and maintained by <a href="https://mangati.com" target="_blank">Mangati</a>',
      docs_link: '/docs/#/en/'
    },
    es: {
      hosting_banner: 'Conozca el <a href="https://novosga.com/?utm_source=novosga&utm_medium=banner" target="_blank">alojamiento profesional de NovoSGA</a>.',
      nav_docs: 'Documentación',
      subtitle: 'Sistema de <strong>gestión de colas</strong> de atención',
      feature_fast_title: '<strong>Rápido</strong>',
      feature_fast_desc: '<strong>Rápido</strong> de instalar, <strong>rápido</strong> de usar',
      feature_extensible_title: '<strong>Extensible</strong>',
      feature_extensible_desc: 'Aplicación construida en <strong>módulos</strong>',
      feature_modern_title: '<strong>Moderno</strong>',
      feature_modern_desc: 'Uso de <strong>tecnologías web</strong> modernas',
      feature_free_title: '<strong>Gratis</strong>',
      feature_free_desc: 'Código abierto disponible en <strong>GitHub</strong>',
      getting_started: 'Empezar',
      docs_btn: '<strong>Documentación</strong>',
      hosting_btn: 'Alojamiento',
      contribute_btn: 'Contribuir',
      footer: '<strong>NovoSGA</strong> by <a href="https://mangati.com" target="_blank">Mangati</a>. Todo el código fuente está bajo la licencia <a href="http://opensource.org/licenses/mit-license.php">MIT</a>.',
      banner_developed: 'Desarrollado y mantenido por <a href="https://mangati.com" target="_blank">Mangati</a>',
      docs_link: '/docs/#/es/'
    }
  };

  var supportedLangs = ['pt-br', 'en', 'es'];

  function getLanguage() {
    var params = new URLSearchParams(window.location.search);
    var paramLang = params.get('lang');
    if (paramLang && supportedLangs.indexOf(paramLang) !== -1) {
      return paramLang;
    }

    var stored = localStorage.getItem('novosga_lang');
    if (stored && supportedLangs.indexOf(stored) !== -1) {
      return stored;
    }

    var browserLang = (navigator.language || navigator.userLanguage || '').toLowerCase();
    if (browserLang.indexOf('es') === 0) return 'es';
    if (browserLang.indexOf('en') === 0) return 'en';

    return 'pt-br';
  }

  function setLanguage(lang) {
    if (supportedLangs.indexOf(lang) === -1) return;

    localStorage.setItem('novosga_lang', lang);
    applyTranslations(lang);

    var params = new URLSearchParams(window.location.search);
    params.set('lang', lang);
    var newUrl = window.location.pathname + '?' + params.toString();
    window.history.replaceState({}, '', newUrl);
  }

  function applyTranslations(lang) {
    var t = translations[lang];
    if (!t) return;

    document.documentElement.setAttribute('lang', lang);

    var elements = document.querySelectorAll('[data-i18n]');
    for (var i = 0; i < elements.length; i++) {
      var key = elements[i].getAttribute('data-i18n');
      if (t[key] !== undefined) {
        elements[i].innerHTML = t[key];
      }
    }

    var links = document.querySelectorAll('[data-i18n-href]');
    for (var i = 0; i < links.length; i++) {
      var key = links[i].getAttribute('data-i18n-href');
      if (t[key] !== undefined) {
        links[i].setAttribute('href', t[key]);
      }
    }

    var selectors = document.querySelectorAll('.lang-selector a');
    for (var i = 0; i < selectors.length; i++) {
      selectors[i].classList.remove('is-active');
      if (selectors[i].getAttribute('data-lang') === lang) {
        selectors[i].classList.add('is-active');
      }
    }
  }

  document.addEventListener('DOMContentLoaded', function () {
    var lang = getLanguage();
    applyTranslations(lang);

    document.addEventListener('click', function (e) {
      var langLink = e.target.closest('[data-lang]');
      if (langLink) {
        e.preventDefault();
        setLanguage(langLink.getAttribute('data-lang'));
      }
    });
  });
})();
