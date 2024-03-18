defmodule PDF2tex do
  def retain_layout(input_pdf) do
    command = "pdftotext"
    args = ["-layout", input_pdf, "-"]
    execute_pdftotext(command, args)
  end

  def raw_text(input_pdf) do
    command = "pdftotext"
    args = ["-raw", input_pdf, "-"]
    execute_pdftotext(command, args)
  end

  defp execute_pdftotext(command, args) do
    case System.cmd(command, args) do
      {output, 0} ->
        {:ok, output}

      {output, _} ->
        {:error, output}
    end
  end
end

