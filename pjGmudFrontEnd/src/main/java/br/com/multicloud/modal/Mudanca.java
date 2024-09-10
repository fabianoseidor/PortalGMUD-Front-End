package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import br.com.multicloud.modal.enums.StatusRdm;

public class Mudanca implements Serializable{

	private static final long serialVersionUID = -6221853869394115281L;

	private Long id_mudanca;
	private String titulo_mudanca;
	private LocalDateTime dt_criacao;
	private LocalDateTime dt_alteracao;
	private String login_user;
	private StatusRdm statusMudanca;
	private TipoMudanca tipoMudanca;
	private Criticidade criticidade;
	private ImpactoMudanca impactoMudanca;
	private CategoriaPadrao categoriaPadrao;
	private List<PlanoComunicacao> planoComunicacoes = new ArrayList<PlanoComunicacao>();
	private DadosMudanca dadosMudanca = new DadosMudanca();
	private List<AtividadeMudanca> atividadesMudanca = new ArrayList<AtividadeMudanca>();
	private ReportFinal reportFinal = new ReportFinal();
	private List<ArquivosMudanca> arquivosMudanca = new ArrayList<ArquivosMudanca>();
	private List<ArqAprovacaoCliente> arqAprovacaoCliente = new ArrayList<ArqAprovacaoCliente>();
	private List<MudancaClientesAfetados> mudancaClientesAfetados = new ArrayList<MudancaClientesAfetados>();
	private List<ListaAprovadores> listaAprovadores = new ArrayList<ListaAprovadores>();
	private AcaoPosAtividade acaoPosAtividade = new AcaoPosAtividade();

	public AcaoPosAtividade getAcaoPosAtividade() {
		return acaoPosAtividade;
	}

	public void setAcaoPosAtividade(AcaoPosAtividade acaoPosAtividade) {
		this.acaoPosAtividade = acaoPosAtividade;
	}

	public Long getId_mudanca() {
		return id_mudanca;
	}

	public void setId_mudanca(Long id_mudanca) {
		this.id_mudanca = id_mudanca;
	}

	public String getTitulo_mudanca() {
		return titulo_mudanca;
	}

	public void setTitulo_mudanca(String titulo_mudanca) {
		this.titulo_mudanca = titulo_mudanca;
	}

	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}

	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}

	public LocalDateTime getDt_alteracao() {
		return dt_alteracao;
	}

	public void setDt_alteracao(LocalDateTime dt_alteracao) {
		this.dt_alteracao = dt_alteracao;
	}

	public String getLogin_user() {
		return login_user;
	}

	public void setLogin_user(String login_user) {
		this.login_user = login_user;
	}

	public StatusRdm getStatusMudanca() {
		return statusMudanca;
	}

	public void setStatusMudanca(StatusRdm statusMudanca) {
		this.statusMudanca = statusMudanca;
	}

	public TipoMudanca getTipoMudanca() {
		return tipoMudanca;
	}

	public void setTipoMudanca(TipoMudanca tipoMudanca) {
		this.tipoMudanca = tipoMudanca;
	}

	public Criticidade getCriticidade() {
		return criticidade;
	}

	public void setCriticidade(Criticidade criticidade) {
		this.criticidade = criticidade;
	}

	public ImpactoMudanca getImpactoMudanca() {
		return impactoMudanca;
	}

	public void setImpactoMudanca(ImpactoMudanca impactoMudanca) {
		this.impactoMudanca = impactoMudanca;
	}

	public CategoriaPadrao getCategoriaPadrao() {
		return categoriaPadrao;
	}

	public void setCategoriaPadrao(CategoriaPadrao categoriaPadrao) {
		this.categoriaPadrao = categoriaPadrao;
	}

	public List<PlanoComunicacao> getPlanoComunicacoes() {
		return planoComunicacoes;
	}

	public void setPlanoComunicacoes(List<PlanoComunicacao> planoComunicacoes) {
		this.planoComunicacoes = planoComunicacoes;
	}

	public DadosMudanca getDadosMudanca() {
		return dadosMudanca;
	}

	public void setDadosMudanca(DadosMudanca dadosMudanca) {
		this.dadosMudanca = dadosMudanca;
	}

	public List<AtividadeMudanca> getAtividadesMudanca() {
		return atividadesMudanca;
	}

	public void setAtividadesMudanca(List<AtividadeMudanca> atividadesMudanca) {
		this.atividadesMudanca = atividadesMudanca;
	}

	public ReportFinal getReportFinal() {
		return reportFinal;
	}

	public void setReportFinal(ReportFinal reportFinal) {
		this.reportFinal = reportFinal;
	}

	public List<ArquivosMudanca> getArquivosMudanca() {
		return arquivosMudanca;
	}

	public void setArquivosMudanca(List<ArquivosMudanca> arquivosMudanca) {
		this.arquivosMudanca = arquivosMudanca;
	}

	public List<ArqAprovacaoCliente> getArqAprovacaoCliente() {
		return arqAprovacaoCliente;
	}

	public void setArqAprovacaoCliente(List<ArqAprovacaoCliente> arqAprovacaoCliente) {
		this.arqAprovacaoCliente = arqAprovacaoCliente;
	}

	public List<MudancaClientesAfetados> getMudancaClientesAfetados() {
		return mudancaClientesAfetados;
	}

	public void setMudancaClientesAfetados(List<MudancaClientesAfetados> mudancaClientesAfetados) {
		this.mudancaClientesAfetados = mudancaClientesAfetados;
	}

	public List<ListaAprovadores> getListaAprovadores() {
		return listaAprovadores;
	}

	public void setListaAprovadores(List<ListaAprovadores> listaAprovadores) {
		this.listaAprovadores = listaAprovadores;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_mudanca);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Mudanca other = (Mudanca) obj;
		return Objects.equals(id_mudanca, other.id_mudanca);
	}

	@Override
	public String toString() {
		return "Mudanca [id_mudanca=" + id_mudanca + ", titulo_mudanca=" + titulo_mudanca + ", dt_criacao=" + dt_criacao
				+ ", dt_alteracao=" + dt_alteracao + ", login_user=" + login_user + ", statusMudanca=" + statusMudanca
				+ ", tipoMudanca=" + tipoMudanca + ", criticidade=" + criticidade + ", impactoMudanca=" + impactoMudanca
				+ ", categoriaPadrao=" + categoriaPadrao + ", planoComunicacoes=" + planoComunicacoes
				+ ", dadosMudanca=" + dadosMudanca + ", atividadesMudanca=" + atividadesMudanca + ", reportFinal="
				+ reportFinal + ", arquivosMudanca=" + arquivosMudanca + ", arqAprovacaoCliente=" + arqAprovacaoCliente
				+ ", mudancaClientesAfetados=" + mudancaClientesAfetados + ", listaAprovadores=" + listaAprovadores
				+ "]";
	}


   
}
