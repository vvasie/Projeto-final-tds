package br.edu.utfpr.tdsapi.model;

import java.util.Objects;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="tb_tarefa")
public class Tarefa {	
		
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String descricao;
		
	@ManyToOne
	@JoinColumn(name = "prioridade")
	private Prioridade prioridade;
	
	private int situacao;
	
	@ManyToOne
	@JoinColumn(name = "executor")
	private Responsavel responsavel;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dataInicio;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dataFim;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}@NotNull
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public Prioridade getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(Prioridade prioridade) {
		this.prioridade = prioridade;
	}
	public int getSituacao() {
		return situacao;
	}
	public void setSituacao(int situacao) {
		this.situacao = situacao;
	}
	public Responsavel getResponsavel() {
		return responsavel;
	}
	public void setResponsavel(Responsavel responsavel) {
		this.responsavel = responsavel;
	}
	public Date getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}
	public Date getDataFim() {
		return dataFim;
	}
	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Tarefa other = (Tarefa) obj;
		return Objects.equals(id, other.id);
	}
	

}
