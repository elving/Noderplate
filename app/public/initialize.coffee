window.noderplate = window.noderplate ? {}
noderplate.views = noderplate.views ? {}
noderplate.models = noderplate.models ? {}
noderplate.collections = noderplate.collections ? {}

AppView = require 'views/app_view'

noderplate.views.AppView = new AppView()