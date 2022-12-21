package br.edu.utfpr.tdsapi.repository.filter;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class TarefaFilter {
	
	private String descricao;
	private int situacao;
	private int prioridade;
	private int responsavel;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dataInicio;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dataFim;
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getSituacao() {
		return situacao;
	}
	public void setSituacao(int situacao) {
		this.situacao = situacao;
	}
	public int getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(int prioridade) {
		this.prioridade = prioridade;
	}
	public int getResponsavel() {
		return responsavel;
	}
	public void setResponsavel(int responsavel) {
		this.responsavel = responsavel;
	}
	public LocalDate getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}
	public LocalDate getDataFim() {
		return dataFim;
	}
	public void setDataFim(LocalDate dataFim) {
		this.dataFim = dataFim;
	}	

}
