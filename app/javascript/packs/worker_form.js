import { notefy } from './notifier'; 
//  MAIN
$(document).ready(() => {
    $("#worker_salary").blur((e) => {
        let salary = $(e.target).val().trim();

        // Verifica se o valor do input é um número decimal positivo
        if (/^\d*\.?\d+$/.test(salary) && parseFloat(salary) >= 0) {
          let requestData = { salary };

          $.ajax({
            type: "POST",
            url: "/inss_descount",
            data: requestData,
            success: function(response) {
              notefy("INSS",
                    `Seu desconto será de R$${response.tax}`);
            },
            error: function(error) {
              console.error("Error - serverside", error);
            }
          });
        } else {
          console.log("Não é um número decimal positivo");
        }
    });
});