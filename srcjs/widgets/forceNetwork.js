import "widgets";
import { asHeader } from "../modules/header.js";
import * as am5 from "@amcharts/amcharts5";
import * as am5hierarchy from "@amcharts/amcharts5/hierarchy";
import * as am5themes_Animated from "@amcharts/amcharts5/themes/Animated";

HTMLWidgets.widget({
  name: "forceNetwork",

  type: "output",

  factory: function (el, width, height) {
    // TODO: define shared variables for this instance

    return {
      renderValue: function (x) {
        // TODO: code to render the widget, e.g.
        // el.innerHTML = asHeader(x);
        am5.ready(function () {
          // Create root element
          var root = am5.Root.new(el);
          // https://www.amcharts.com/docs/v5/getting-started/#Root_element
          var data = x.data;
          console.log(data);
          // Set themes
          // https://www.amcharts.com/docs/v5/concepts/themes/
          //root.setThemes([am5themes_Animated.new(root)]);

          // Create wrapper container
          var container = root.container.children.push(
            am5.Container.new(root, {
              width: am5.percent(100),
              height: am5.percent(100),
              layout: root.verticalLayout
            })
          );

          // Create series
          // https://www.amcharts.com/docs/v5/charts/hierarchy/#Adding
          var series = container.children.push(
            am5hierarchy.ForceDirected.new(root, {
              singleBranchOnly: false,
              downDepth: 2,
              topDepth: 1,
              initialDepth: 1,
              valueField: "value",
              categoryField: "name",
              childDataField: "children",
              idField: "name",
              linkWithField: "linkWith",
              manyBodyStrength: -10,
              centerStrength: 0.8
            })
          );

          series.get("colors").setAll({
            step: 2
          });

          series.links.template.set("strength", 0.5);

          series.data.setAll([data]);

          series.set("selectedDataItem", series.dataItems[0]);

          // Make stuff animate on load
          series.appear(1000, 100);
        });
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
