Changelog

- v0.1
	- Arquivos adicionados/alterados: 'estilos.css', 'index.html'
	- Observação: versão inicial com a página HTML do formulário e o CSS básico.

- v0.2
	- Arquivos adicionados/alterados: 'banco.sql', 'conectar.php'
	- Observação: incluiu o script SQL de criação/população do banco e o arquivo de conexão com as credenciais 'mysqli'.

- v0.3
	- Arquivos adicionados/alterados: 'pesquisa-resultado.php'
	- Observação: esta versão adicionou o script que recebe o 'POST' e exibe os resultados (lógica de busca por 'Sexo').

Explicação dos comandos de pesquisa

1) Inclusão da conexão

include_once("conectar.php");


- O 'include_once("conectar.php")' injeta o código de 'conectar.php' no ponto em que é chamado. Esse arquivo cria a variável '$strcon' usando 'mysqli_connect(...)', que é usada depois para executar queries.
- Se 'conectar.php' falhar (ex.: erro de conexão), o restante do script pode gerar erros ao tentar usar '$strcon'.

2) Recebimento do parâmetro de pesquisa

$pesquisa = $_POST['Sexo'];

- Aqui o script lê o valor enviado pelo formulário via método POST. No 'index.html' o campo select tem 'name="Sexo"', então o valor enviado será algo como 'M', 'F' ou 'N'.

3) Preparação e execução da query SQL


$sql = "SELECT * FROM cadastro WHERE Sexo = '$pesquisa'";
$resultado = mysqli_query($strcon, $sql) or die("Erro ao retornar dados");


- O SQL seleciona todas as colunas da tabela 'cadastro' onde o campo 'Sexo' é igual ao valor recebido.
- 'mysqli_query($strcon, $sql)' envia a query ao servidor MySQL e retorna um resultado (resource/objeto) ou 'false' em caso de erro.
- 'or die("Erro ao retornar dados")' faz com que, em caso de erro na query, o script pare e imprima essa mensagem.

4) Leitura dos resultados e exibição em tabela HTML

while ($registro = mysqli_fetch_array($resultado)) {
		$nome = $registro['NomeCliente'];
		$sobrenome = $registro['SobrenomeCliente'];
		$sexo = $registro['Sexo'];
		echo "<tr>";
		echo "<td>" . $nome . "</td>";
		echo "<td>" . $sobrenome . "</td>";
		echo "<td>" . $sexo . "</td>";
		echo "</tr>";
}

- 'mysqli_fetch_array($resultado)' busca a próxima linha do conjunto de resultados como um array associativo/numerado. O loop continua até que não haja mais linhas.
- Cada linha é extraída e as colunas 'NomeCliente', 'SobrenomeCliente' e 'Sexo' são exibidas em células '<td>' de uma linha '<tr>' da tabela HTML.

5) Fechamento da conexão e finalização da tabela

mysqli_close($strcon);
echo "</table>";

- 'mysqli_close($strcon)' fecha a conexão com o banco.
- 'echo "</table>";' finaliza a tabela HTML iniciada anteriormente.