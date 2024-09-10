package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class ArquivosMudanca implements Serializable{

	private static final long serialVersionUID = -4800083005942260356L;
	
	private Long id_arquivos_mudanca;
	private String arquivo;
	private String titulo_arquivo;
	private String nome_arq;
	private String tipo_Arq;
	private Mudanca mudanca;
	private LocalDateTime dt_criacao;
	

	public Long getId_arquivos_mudanca() {
		return id_arquivos_mudanca;
	}

	public void setId_arquivos_mudanca(Long id_arquivos_mudanca) {
		this.id_arquivos_mudanca = id_arquivos_mudanca;
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

	public String getTipo_Arq() {
		return tipo_Arq;
	}

	public void setTipo_Arq(String tipo_Arq) {
		this.tipo_Arq = tipo_Arq;
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

	public String getTitulo_arquivo() {
		return titulo_arquivo;
	}

	public void setTitulo_arquivo(String titulo_arquivo) {
		this.titulo_arquivo = titulo_arquivo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_arquivos_mudanca);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ArquivosMudanca other = (ArquivosMudanca) obj;
		return Objects.equals(id_arquivos_mudanca, other.id_arquivos_mudanca);
	}

	@Override
	public String toString() {
		return "ArquivosMudanca [id_arquivos_mudanca=" + id_arquivos_mudanca + ", arquivo=" + arquivo
				+ ", titulo_arquivo=" + titulo_arquivo + ", nome_arq=" + nome_arq + ", tipo_Arq=" + tipo_Arq
				+ ", mudanca=" + mudanca + ", dt_criacao=" + dt_criacao + "]";
	}


}
