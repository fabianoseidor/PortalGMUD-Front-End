package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;


public class ArqAprovacaoCliente implements Serializable{


	private static final long serialVersionUID = -3477912375905255261L;
	
	private Long id_arq_apro_cli;
	private String nome_arq;
	private String titulo_arquivo;
	private String arquivo;
	private String tipo_Arq;
	private Mudanca mudanca;
	private LocalDateTime dt_criacao;

	public Long getId_arq_apro_cli() {
		return id_arq_apro_cli;
	}

	public void setId_arq_apro_cli(Long id_arq_apro_cli) {
		this.id_arq_apro_cli = id_arq_apro_cli;
	}

	public String getNome_arq() {
		return nome_arq;
	}

	public void setNome_arq(String nome_arq) {
		this.nome_arq = nome_arq;
	}

	public String getArquivo() {
		return arquivo;
	}

	public void setArquivo(String arquivo) {
		this.arquivo = arquivo;
	}

	public Mudanca getMudanca() {
		return mudanca;
	}

	public void setMudanca(Mudanca mudanca) {
		this.mudanca = mudanca;
	}

	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}

	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}

	public String getTipo_Arq() {
		return tipo_Arq;
	}

	public void setTipo_Arq(String tipo_Arq) {
		this.tipo_Arq = tipo_Arq;
	}

	public String getTitulo_arquivo() {
		return titulo_arquivo;
	}

	public void setTitulo_arquivo(String titulo_arquivo) {
		this.titulo_arquivo = titulo_arquivo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_arq_apro_cli);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ArqAprovacaoCliente other = (ArqAprovacaoCliente) obj;
		return Objects.equals(id_arq_apro_cli, other.id_arq_apro_cli);
	}

	@Override
	public String toString() {
		return "ArqAprovacaoCliente [id_arq_apro_cli=" + id_arq_apro_cli + ", nome_arq=" + nome_arq
				+ ", titulo_arquivo=" + titulo_arquivo + ", arquivo=" + arquivo + ", tipo_Arq=" + tipo_Arq
				+ ", mudanca=" + mudanca + ", dt_criacao=" + dt_criacao + "]";
	}


    
}
