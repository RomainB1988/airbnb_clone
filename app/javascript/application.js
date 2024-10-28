// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import * as RailsUJS from "@rails/ujs";
Rails.start();
import "@hotwired/turbo-rails";
import "controllers";


console.log("Rails UJS loaded");
