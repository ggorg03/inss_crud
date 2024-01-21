//  MAIN
$(document).ready(() => {
    $("#worker_salary").blur((e) => {
        let salary = $(e.target).val();

        // Verifica se o valor do input é um número decimal positivo
        if (/^\d*\.?\d+$/.test(salary) && parseFloat(salary) >= 0) {
          var requestData = { value: salary };

          $.ajax({
            type: "POST",
            url: "calculate_tax",
            data: requestData,
            success: function(response) {
              console.log("Resposta do servidor:", response);
            },
            error: function(error) {
              console.error("Erro na requisição AJAX:", error);
            }
          });
        } else {
          console.log("Não é um número decimal positivo");
        }
    });
});